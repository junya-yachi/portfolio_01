// $(function(){
  $('.fadeInUpTrigger').on('inview', function(event, isInView) {
    if (isInView) {//表示領域に入った時
      $(this).addClass('animate__animated animate__fadeInUp');//クラス名が付与
    } else {//表示領域から出た時
      $(this).removeClass('animate__animated animate__fadeInUp');//クラス名が除去
    }
  });
// });

// $(function () {
//   $(".main_item_3").css("color", "#0000FF");
// }); //jqeuryは成功している
