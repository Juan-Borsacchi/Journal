//
//  Carousel.swift
//  Journal
//
//  Created by Igor Carrasco on 14/07/26.
//

import SwiftUI

struct Carousel: View {
    @State private var days = 10
    @State private var listOfDays: [DayHistory] = []
    
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
                        ForEach(listOfDays.indices, id: \.self) { index in
                            drawDayItem(index: index)
                                .id(index)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .onAppear {
                        DispatchQueue.main.async {
                            if let todayIndex = listOfDays.firstIndex(where: { Calendar.current.isDateInToday($0.date) }) {
                                proxy.scrollTo(todayIndex, anchor: .center)
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
            lastTenDaysGenerator()
        }
    }
    
    @ViewBuilder
    private func drawDayItem(index: Int) -> some View {
        let day = listOfDays[index]
        let isToday = Calendar.current.isDateInToday(day.date)
        
        VStack(spacing: 6) {
            if day.isFull {
                TimelineView(.animation) { timeline in
                    let tempo = timeline.date.timeIntervalSinceReferenceDate
                    
                    let offsetSincronizado = sin(tempo * 2) * 4 - 4
                    Image("book.closed.fire")
                        .renderingMode(.original)
                        .font(isToday ? .system(size: 45) : .title)
                        .offset(y: offsetSincronizado)
                }
            }
            
            VStack{
                Text(day.numeroDia)
                    .font(isToday ? .largeTitle : .title)
                    .bold()
                
                if isToday {
                    Spacer()
                    Text("HOJE")
                        .font(.body)
                        .bold()
                }
                
            }
            .padding(.vertical)
            .frame(width: isToday ? 100 : 50, height: isToday ? 100 : 50)
            .background {
                ZCoreGlassView(isFull: day.isFull)
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
        .frame(height: day.isFull ? (isToday ? 160 : 95) : 95, alignment: .bottom)
        .onTapGesture {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                listOfDays[index].isFull.toggle()
            }
        }
    }
    
    private func lastTenDaysGenerator() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        var temp: [DayHistory] = []
        
        let rowRange = 5
        
        for i in -rowRange...rowRange {
            if let date = calendar.date(byAdding: .day, value: i, to: today) {
                var newDay = DayHistory(date: date)
                
                if i < 0{
                    newDay.isFull = true
                }
                temp.append(newDay)
            }
        }
        
        self.listOfDays.append(contentsOf: temp)
    }
    
    private struct ZCoreGlassView: View {
        let isFull: Bool
        
        var body: some View {
            ZStack {
                Color.clear
                    .background(.ultraThinMaterial)
                let baseColor = isFull ? Color.action : Color.toDo
                baseColor.opacity(isFull ? 1 : 0.9)
                
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
