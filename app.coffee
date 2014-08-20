@newApp = angular.module 'newApp', []

class MoviePanel 
  constructor: (@$scope, @$http) ->
    $scope.search = (amovie)-> 
      console.log amovie
      $http(
        method:'GET'
        url: 'http://www.omdbapi.com/'
        params: {s: amovie}
      ).success( (data, status, headers, config) ->
        $scope.movieList = data.Search
        console.log data.Search
        # for num in $scope.movieList
        # console.log $scope.movieList[i].Title for i in $scope.movieList
        console.log $scope.movieList[1].Year
      ).error( (data, status, headers, config) ->
        console.log "failure :("
      )

    $scope.showDetails = (movie) -> 
      # console.log movie.imdbID
      # console.log movie
      $http(
        method:'GET'
        url: 'http://www.omdbapi.com/'
        params: {i: movie.imdbID}
      ).success( (data, status, headers, config) ->
        # console.log "howdy"
        # console.log data.Plot
        # console.log data.Poster
        $scope.moviePlot = data.Plot
        moviePlot = "This is a fake movie plot"
        $scope.moviePoster = data.Poster
        $scope.movieTitle = data.Title
        console.log "scope movie plot: ", $scope.moviePlot #helpers are taking from here because of scope
        console.log "movie plot: ", moviePlot #helpers are taking from here because of scope
        console.log "scope movie Poster: ", $scope.moviePoster
        console.log "scope movie title: ", $scope.movieTitle
      ).error( (data, status, headers, config) ->
        console.log "failure :( Part II"
      )

MoviePanel.$inject = ["$scope", "$http"]  #predefined dependency injection
newApp.controller "MoviePanel", MoviePanel  

