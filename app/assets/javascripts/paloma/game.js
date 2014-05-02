var GameController = Paloma.controller('Game');

GameController.prototype.new = function() {
    $(document).on("click", "#reset_moves", function(e) {
        $('#moves').html('');
        $('#move_list').html("");
        $('#fight_button').hide();
    });
    $(document).on("click", ".game_acts", function(e) {
        if ($('.list-group-item').length < 10) {
            $('#moves').append($(this).data("act") + ",");
            $('#move_list').append("<li class='list-group-item'>" + $(this).data("name") + "</li>");
        }
        if ($('.list-group-item').length == 10){
            $('#fight_button').show();
        }
    });
}
GameController.prototype.show = function() {
    var game_id = this.params['game_id'];
    var faye_path = this.params['faye_path'];

    var game_area = "/game/" + game_id + "/combat";
    var faye = new Faye.Client(faye_path);

    faye.subscribe(game_area, function(data) {
        console.log(data);
        if (!data.status) {
            $('#game_status').html("<h2>You loose</h2>");
            $('#adversary_status').html("<h2>Your adversary win</h2>");
        } else {
            $('#game_status').html("<h2>You win</h2>");
            $('#adversary_status').html("<h2>Your adversary loose</h2>");
        }
        $('#move_list').html("");
        for (var i=0;i< data.result.length;i++){
            var iwin = "";
            if (data.result[i] == "W"){
                iwin = "win";
            }
            $('#adversary_moves').append("<li class='list-group-item "+iwin+"'>"+data.adversary_moves[i]+"</li>");
            
            iwin = "";
            if (data.result[i] == "L"){
                iwin = "win";
            }
            $('#move_list').append("<li class='list-group-item "+iwin+"'>"+data.waiter_moves[i]+"</li>");
        }
        
        
        //$('#adversary_moves').val(data.content);
        $('.adversary_move').show();
    });

}