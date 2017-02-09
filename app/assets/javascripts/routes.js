document.addEventListener("turbolinks:load", function() {
    $('a.edit_route').click(function (e) {
        e.preventDefault();

        var route_id = $(this).data('routeId');
        var form;
        var title

        console.log(route_id);

        form = $('#edit_route_' + route_id);
        title = $('#route_name_' + route_id);

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