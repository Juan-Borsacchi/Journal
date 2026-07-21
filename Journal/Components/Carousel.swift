//
//  Carousel.swift
//  Journal
//
//  Created by Igor Carrasco on 14/07/26.
//

import SwiftUI

struct Carousel: View {
    @State private var days = 10
    @State private var listaDias: [DiaHistorico] = []
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Text("Sequência Diária:")
                        .font(.callout)
                        .bold()
                    Spacer()
                    Text(days >= 2 ? "\(days) dias seguidos": "\(days)  dia seguido")
                }
                .padding(8)
                
                Divider()
            }
            .padding(8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxy in
                    HStack(alignment: .bottom, spacing: 16) {
                        ForEach(listaDias.indices, id: \.self) { index in
                            desenharDiaItem(index: index)
                                .id(index)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .onAppear {
                        DispatchQueue.main.async {
                            if let indexHoje = listaDias.firstIndex(where: { Calendar.current.isDateInToday($0.data) }) {
                                proxy.scrollTo(indexHoje, anchor: .center)
                            }
                        }
                    }
                }
            }
            .padding(.vertical,8)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        //.padding()
        .onAppear {
            gerarUltimosDezDias()
        }
    }
    
    @ViewBuilder
    private func desenharDiaItem(index: Int) -> some View {
        let dia = listaDias[index]
        let eHoje = Calendar.current.isDateInToday(dia.data)
        
        VStack(spacing: 6) {
            if dia.estaPreenchido {
                TimelineView(.animation) { timeline in
                    let tempo = timeline.date.timeIntervalSinceReferenceDate
                    
                    let offsetSincronizado = sin(tempo * 2) * 4 - 4
                    Image(systemName: "book.closed.fill")
                        .renderingMode(.original)
                        .font(eHoje ? .system(size: 45) : .title)
                        .offset(y: offsetSincronizado)
                }
            }
            
            VStack{
                Text(dia.numeroDia)
                    .font(eHoje ? .largeTitle : .title)
                    .bold()
                
                if eHoje {
                    Spacer()
                    Text("HOJE")
                        .font(.body)
                        .bold()
                }
                
            }
            .padding(.vertical)
            .frame(width: eHoje ? 100 : 50, height: eHoje ? 100 : 50)
            .background {
                ZCoreGlassView(estaPreenchido: dia.estaPreenchido)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        LinearGradient(
                            colors: [.white.opacity(0.4), .white.opacity(0.05), .black.opacity(0.05), .white.opacity(0.15)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            }
            .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
        }
        .frame(height: dia.estaPreenchido ? (eHoje ? 160 : 95) : 95, alignment: .bottom)
        .onTapGesture {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                listaDias[index].estaPreenchido.toggle()
            }
        }
    }
    
    private func gerarUltimosDezDias() {
        let calendario = Calendar.current
        let hoje = calendario.startOfDay(for: Date())
        var temporario: [DiaHistorico] = []
        
        let alcance = 5
        
        for i in -alcance...alcance {
            if let data = calendario.date(byAdding: .day, value: i, to: hoje) {
                temporario.append(DiaHistorico(data: data))
            }
        }
        
        self.listaDias.append(contentsOf: temporario)
    }
    
    private struct ZCoreGlassView: View {
        let estaPreenchido: Bool
        
        var body: some View {
            ZStack {
                Color.clear
                    .background(.ultraThinMaterial)
                let corBase = estaPreenchido ? Color.action : Color.toDo
                corBase.opacity(estaPreenchido ? 1 : 0.9)
                
                LinearGradient(
                    colors: [.white.opacity(0.25), .white.opacity(0.0)],
                    startPoint: .topLeading,
                    endPoint: .center
                )
            }
        }
    }
    
}


#Preview {
    Carousel()
}
