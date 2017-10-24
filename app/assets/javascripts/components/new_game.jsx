class NewGame extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      mode: null,
      moves: [null, null, null, null, null, null, null, null, null, null]
    }
  }

  setMove(index, value){
    var moves = this.state.moves
    moves[index] = value

    this.setState({
      moves
    })
  }

  allMovesEntered(){
    return this.state.moves.indexOf(null) == -1
  }

  render(){
    const props = this.props
    const state = this.state

    return <div>
      <h2>New Game</h2>

      <button>Generate New Game</button><br/>
      Join Existing Game: <input id="game-id" type="text" placeholder="Game ID" ref={(input) => { this.gameIdInput = input }} />

      {
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map(function(i){
          return <div className="move" key={"move-" + i}>
            <div className="current-move">
              { state.moves[i] || "[please choose]" }
            </div>

            <div className="set-moves">
              <button className="set-move set-rock" onClick={() => this.setMove(i, "rock")}>Rock</button>
              <button className="set-move set-paper" onClick={() => this.setMove(i, "paper")}>Paper</button>
              <button className="set-move set-scissors" onClick={() => this.setMove(i, "scissors")}>Scissors</button>
              <button className="set-move set-spock" onClick={() => this.setMove(i, "spock")}>Spock</button>
              <button className="set-move set-lizard" onClick={() => this.setMove(i, "lizard")}>Lizard</button>
            </div>
          </div>
        }.bind(this))
      }

      <button onClick={() => props.createGameFn(state.moves, this.gameIdInput.value)} disabled={!this.allMovesEntered()}>Fight</button>
    </div>
  }
}
