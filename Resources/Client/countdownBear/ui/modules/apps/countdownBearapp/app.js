angular.module('beamng.apps')
  .directive('countdownBearapp', [function () {
    return {
      template:
      '<div style="width:100%; height:100%;" layout="column" layout-align="center center" class="bngApp">' +
                '<span style="font-size:4em">{{ seconds }}</span>' +
                "<style>.bngApp{background: none;}</style>" +
                "<style>.bngApp span{opacity: 1; transition: opacity 1s ease-out; text-shadow: 2px 2px 4x gray;}</style>" +
            '</div>',
      replace: true,
      link:
      function($scope) {
        console.log('Countdown app loaded')
        $scope.seconds = "";



        $scope.$on('countdownBearappUpdate', function (_, data) {
          $scope.$evalAsync(function () {  

             $scope.seconds = data.seconds;
              //Here you can change the 0 to a "GO!" if you like. 
              //Increase the timeout (500) if you like the last number to be visible for a longer time
              if ($scope.seconds === "0") {
                setTimeout(function(){
                  $scope.seconds = "";
                }, 500)
              }
        });
      });
      }
      
    };
  }]);
//   .bngApp span{
//     opacity: 1;
//     transition: opacity 1s ease-out;
// }
// .hidden {
//     opacity: 0; /* Fully transparent */
// } 
