$(function(){
    $('.tops_show__main--right').hover(function(){
        //オーバーしたliのインデックスを取得
        var index = $('.tops_show__main--right').index(this);
        //オーバーした画像URLを取得
        var imageurl = $('.tops_show__main--right').eq(index).find('img').attr('src');
        //ulのクラス名を取得（空白で分割）
        className = $(this).parent().attr('class').split(" ");
        //元のメイン画像を保存しておく
        defaultImage = $('img.mainimage.'+className[1]).attr('src');
        $('img.mainimage.'+className[1]).attr('src',imageurl);
    },function(){
        $('img.mainimage.'+className[1]).attr('src',defaultImage);
    });
});
