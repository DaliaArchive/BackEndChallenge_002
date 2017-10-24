class WaitingGame extends React.Component {
  constructor(props) {
    super(props)
  }

  render(){
    const props = this.props

    return <div>
      <div className="game-intro">
        <h2>Waiting for Adversary</h2>
        <GameInfo gameId={props.gameId} />
      </div>

      <MovesList moves={props.movesSelf} />

      <button onClick={props.refreshGameFn}>Refresh</button>
    </div>
  }
}
