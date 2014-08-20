@newApp = angular.module 'newApp', []

class MoviePanel 
  constructor: (@$scope, @$http) ->
    $scope.search = (amovie)-> 
      $http(
        method:'GET'
        url: 'http://www.omdbapi.com/'
        params: {s: amovie}
      ).success( (data, status, headers, config) ->
        $scope.movieList = data.Search
      ).error( (data, status, headers, config) ->
      )

    $scope.showDetails = (movie) -> 
      $http(
        method:'GET'
        url: 'http://www.omdbapi.com/'
        params: {i: movie.imdbID}
      ).success( (data, status, headers, config) ->
        $scope.moviePlot = data.Plot
        $scope.moviePoster = data.Poster
        $scope.movieTitle = data.Title
      ).error( (data, status, headers, config) ->
      )

MoviePanel.$inject = ["$scope", "$http"]  
newApp.controller "MoviePanel", MoviePanel  

