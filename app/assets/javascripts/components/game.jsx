class Game extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      gameId: props.game && props.game.id,
      movesSelf: props.game && props.game.movesSelf || [],
      movesAdversary: props.game && props.game.movesAdversary || [],
    }
  }

  createGame(moves, gameId){
    console.log("game id", gameId)
    $.post("/api", {
      moves,
      gameId,
    }).done((res) => {
      this.setState({
        gameId: res.game.id,
        movesSelf: res.game.movesPlayer1,
        movesAdversary: res.game.movesPlayer2,
      }, () => {
        history.pushState(null, null, `/${res.game.id}`)
      })
    }).fail(() => {
      console.log("Sorry, no extensive error handling implemented for demo app")
    })
  }

  refreshGame(){
    if(!this.state.gameId){ return }

    $.get(`/api/${this.state.gameId}`).done((res) => {
      this.setState({
        gameId: res.game.id,
        movesSelf: res.game.movesPlayer1,
        movesAdversary: res.game.movesPlayer2,
      })
    }).fail((res) => {
      console.log("Sorry, no extensive error handling implemented for demo app")
    })
  }

  render(){
    const state = this.state

    return <div>
      {
        !state.gameId ? <NewGame createGameFn={this.createGame.bind(this)} /> :
        !state.movesAdversary.length ? <WaitingGame gameId={state.gameId} movesSelf={state.movesSelf} refreshGameFn={this.refreshGame.bind(this)} /> :
        <FinishedGame gameId={state.gameId} movesSelf={state.movesSelf} movesAdversary={state.movesAdversary} />
      }
    </div>
  }
}
