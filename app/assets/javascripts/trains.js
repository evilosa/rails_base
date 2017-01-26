document.addEventListener("turbolinks:load", function() {
    $('a.edit_train').click(function (e) {
        e.preventDefault();

        var train_id = $(this).data('trainId');
        var form;
        var title

        console.log(train_id);

        form = $('#edit_train_' + train_id);
        title = $('#train_number_' + train_id);

        if (!$(this).hasClass('cancel')) {
            $(this).html('Отменить');
            $(this).addClass('cancel');
        } else {
            $(this).html('Редактировать');
            $(this).removeClass('cancel');
        }

        form.toggle();
        title.toggle();
    });
});