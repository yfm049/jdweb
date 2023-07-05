$(function() {
    var basepath=$("base").attr("href");
    $('#txtEditor').froalaEditor({
        language: 'zh_cn',
        iframe:true,
        iframeBase:basepath,
        iframeStyleFiles:['assets/css/common.css','assets/css/main.css'],
        toolbarSticky:false,
        imageUploadURL:basepath+'admin/imageUpload',
        imageManagerLoadURL: basepath+'admin/load-files',
        fileUploadURL:basepath+'admin/fileUpload'
    });
    $('.dropify').dropify().on('dropify.afterClear', function(event, element){
        var tid=$(element.element).attr("data-target");
        $(tid).val("");
    });;

    $('#area').change(function () {
        $('#country').html('');
        var a=$(this).val();
        $.post("admin/trade/country",{area:a},function(result){
            $.each(result, function(i, field){
                $('#country').append("<option value="+field.country+">"+field.country+"</option>")
            })
        })
    });

});