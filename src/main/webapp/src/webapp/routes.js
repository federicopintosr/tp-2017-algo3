const routes = ($stateProvider, $urlRouterProvider) => {

    $urlRouterProvider.otherwise("/")

    $stateProvider
        .state('mundo', {
        url: "/",
        templateUrl: "partials/mundo.html",
        controller: "mundoController as MundoController"
        })
        
        .state('entrenador', {
            url: "/entrenador",
            templateUrl: "partials/entrenador.html",
            controller: "entrenadorController as EntrenadorController"
        })

     
}