import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var body: some View {
        VStack{
            Text("Current Player")
            Image(systemName: game.currentPlayer.getImage()
                .getColor())
            Text("Game State")
            VStack(spacing:1) {
                ForEach(game.board,id:\.self){ row in
                    HStack (spacing:1){
                        ForEach(row){ grid in
                            ZStack{
                                Rectangle()
                                    .fill(.gray)
                                Image(systemName: grid.chess.getImage())
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(grid.chess.getColor())
                            }
                            .onTapGesture {
                                game.putChess(grid:grid)
                            }
                        }
                    }
                }
                
            }
            Button{
                game.startGame()
            }label:{
                Text("Restart")
                    .font(.largeTitle)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

