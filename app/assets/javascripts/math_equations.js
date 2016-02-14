$(function() {
    $("#eqed").click(function(e) {
        e.preventDefault();

        $("#image_field").hide();
        $("#question_field").hide();
        $(this).hide();

        $("#editor").show();
        $("#entry").show();
        $("#advanced_eq_question").show();
        $("#eqed_clicked").show();

        EqEditor.embed('editor','things','mini','en-us');
        EqEditor.add(new EqTextArea('equation1', 'entry'),false);

    });

    $("#eqed_clicked").click(function(e) {

        e.preventDefault();

        $("#editor").hide();
        $("#entry").hide();
        $("#advanced_eq_question").hide();
        $(this).hide();

        $("#image_field").show();
        $("#question_field").show();
        $("#eqed").show();

    });

});