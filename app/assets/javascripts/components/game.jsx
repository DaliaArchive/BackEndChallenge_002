class Game extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      gameId: props.gameId,
      movesSelf: props.movesSelf || [],
      movesAdversary: props.movesAdversary || [],
    }
  }

  createGame(moves){
    // Make API Call etc
  }

  refreshGame(){
    // Make API Call etc
  }

  render(){
    const state = this.state

    return <div>
      {
        !state.gameId ? <NewGame createGameFn={this.createGame} /> :
        !state.movesAdversary ? <WaitingGame gameId={state.gameId} movesSelf={state.movesSelf} refreshGameFn={this.refreshGame} /> :
        <FinishedGame gameId={state.gameId} movesSelf={state.movesSelf} movesAdversary={state.moves} />
      }
    </div>
  }
}
