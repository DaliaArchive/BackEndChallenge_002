class FinishedGame extends React.Component {
  constructor(props) {
    super(props)
  }

  render(){
    const props = this.props

    return <div>
      <h2>Game Over</h2>

      <p>Your personal status</p>

      <GameInfo gameId={props.gameId} />
      <Combat movesSelf={props.movesSelf} movesAdversary={props.movesAdversary} />
    </div>
  }
}
