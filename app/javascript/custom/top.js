$(function(){
  $('.fadeInUpTrigger').on('inview', function(isInView) {
    if (isInView) {//表示領域に入った時
      $(this).addClass('animate__animated animate__fadeInUp');//クラス名が付与
    } else {//表示領域から出た時
      $(this).removeClass('animate__animated animate__fadeInUp');//クラス名が除去
    }
  });
});

// $(function(){
//   $('.top_name').hover(
//     function() {
//       $('.header_name_details').addClass('on_hover');
//     },
//     function() {
//       $('.header_name_details').removeClass('on_hover');
//     });
// });

$(function() {
  $('.header_name_details').hide();
  $('.header_user_box').hover(
    function() {
      $(this).children('.header_name_details').fadeIn('fast');
    },
    function() {
      $(this).children('.header_name_details').fadeOut('fast');
    });
});

