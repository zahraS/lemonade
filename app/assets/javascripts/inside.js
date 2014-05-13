        $('#btnSubmit').click(function (e) {
            e.preventDefault();
            var text = $('#body_').val(); // get from editor

            $.ajax({
                cache: false,
                async: true,
                type: "POST",
                dataType: "json",
                url: "/submitPost",
                data: '{ "text": "' + text + '" }',
                contentType: "application/json;charset=utf-8",
                success: function (msg) {
                    if (msg == true) {

                    }
                },
                error: function (e) {

                }
            });
            var newPost = '';
            newPost += '<div class="span12 box box-nomargin"><div class="box-header blue-background"><div class="title"><div class="icon-envelope-alt"></div>';
            newPost += '@userName'; // from server
            newPost += '</div><div class="actions"><a href="#" class="btn box-collapse btn-mini btn-link"><i></i></a></div></div><div class="box-content"><div class="text">';
            newPost += text;
            newPost += '<div class="text-right"><div class="cmTxt" style=""><input type="text" data-="@id" /></div>';
            newPost += '<a href="#" data-="@id" class="btn btn-primary like">Like</a></div><div class="cms"></div></div></div>';
            
            $('.posts').append(newPost);
        });

        $('.like').click(function (e) {
            e.preventDefault();
            var id = $(this).attr('data-');
            var item = this;
            $(item).fadeOut();
            $.ajax({
                cache: false,
                async: true,
                type: "POST",
                dataType: "json",
                url: "/submitPost",
                data: '{ "text": "' + text + '" }',
                contentType: "application/json;charset=utf-8",
                success: function (msg) {
                    if (msg == true) {
                        //$(item).fadeOut();
                    }
                },
                error: function (e) {

                }
            });
        });

        $('#imgAvatar').click(function (e) {
            $("#frmUpload")[0].contentWindow.openUpload();
        });

        $('.cmTxt input').live('keydown' ,function (e) {
            var item = this;
            if (e.which == 13) {
                var text = '';
                var item = this;
                $('.cmTxt input').each(function () {
                    if ($(this).attr('data-') == $(this).attr('data-')) {
                        if ($(this).val() != '') {
                            text = $(this).val();
                            $(item).parent().parent().next('.cms').append('<div class="cm">' + text + '</div>');
                            $(item).val('');
                            $.ajax({
                                cache: false,
                                async: true,
                                type: "POST",
                                dataType: "json",
                                url: "/submitComment",
                                data: '{ "text": "' + text + '" }',
                                contentType: "application/json;charset=utf-8",
                                success: function (msg) {
                                    if (msg == true) {
                                        var newPost = '';
                                    }
                                },
                                error: function (e) {

                                }
                            });
                        }
                    }
                });
            }
        });

        $('.toggle-nav.btn.pull-left').click(function (e) {
            e.preventDefault();
            if ($('.toggle-nav.btn.pull-left').hasClass('d_') == false) {
                $('#main-nav').animate({ width: '3%' }, 'normal');
                $('#content').animate({ 'margin-left': '5%' }, 'normal');
                $('#content').animate({ width: '90%' }, 'slow');
                $('.toggle-nav.btn.pull-left').addClass('d_')
            }
            else {
                $('#main-nav').animate({ width: '20%' }, 'normal');
                $('#content').animate({ 'margin-left': '20%' }, 'normal');
                $('#content').animate({ width: '70%' }, 'normal');
                $('.toggle-nav.btn.pull-left').removeClass('d_')
            }
        });
        
        $('.themes .theme').click(function () {
            var theme = $(this).attr('data-');
            $('head').append('<link rel="stylesheet" type="text/css" href="' + theme + '"/>');
        });

        // setEvaluation
        $('.emotionals .emo').click(function () {
            var emo = $(this).attr('data-');
            $('.emotionals').slideUp();
            $.ajax({
                cache: false,
                async: true,
                type: "POST",
                dataType: "json",
                url: "/setEvaluation",
                data: '{ "emo": "' + emo + '" }',
                contentType: "application/json;charset=utf-8",
                success: function (msg) {
                    if (msg == true) {
                        
                    }
                },
                error: function (e) {

                }
            });
        });

        $('#_cal').datepicker();