class NewGame extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      mode: null,
      moves: [null, null, null, null, null, null, null, null, null, null],
      wantsToCreate: false,
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

  wantsToCreate(){
    return this.setState({
      wantsToCreate: true,
    })
  }

  render(){
    const props = this.props
    const state = this.state

    return <div>
      <div className="game-intro">
        <h2>New Game</h2>
        {
          this.state.wantsToCreate ? <div>Creating Game</div> :
          <div className="which-game-configurator">
            <div><button onClick={this.wantsToCreate.bind(this)}>Create</button></div>
            <div><input id="game-id" type="text" placeholder="Enter ID to Join Existing Game" ref={(input) => { this.gameIdInput = input }} /></div>
          </div>
        }
      </div>

      <div className="game-content move-configurator">
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
      </div>

      <button onClick={() => props.createGameFn(state.moves, this.gameIdInput.value)} disabled={!this.allMovesEntered()}>Fight</button>
    </div>
  }
}
