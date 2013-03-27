function controllerAdvogado ($scope, $http, $window) {

	$ = jQuery;

	$scope.salvar = function(){
		if($scope.unidade.id > 0){
			$http.put('../advogadoes', $scope.unidade).success(function(data){
				$scope.reset();
				$window.alert("Atualizado com sucesso!");
			});			
		} else {
			$http.post('../advogadoes', $scope.unidade).success(function(data){
			$scope.lista.unshift(data);
			init();
			$scope.reset();
		});
		}
	};

	$scope.editar = function(unidade){
		$scope.unidade = unidade;
	};

	$scope.detalhes = function(unidade){
		$scope.unidade = unidade;
	};

	$scope.excluir = function(unidade){
		var confirm = $window.confirm("Tem certeza que deseja excluir o Advogado: "+ unidade.nome + "?");
		if(confirm){
			$http.delete('../advogadoes/'+unidade.id).success(function(data){
				var index = $scope.lista.indexOf(unidade);
				$scope.lista.splice(index, 1);
			});
		}
	};	

	$scope.reset = function(){
		$scope.unidade = {nome: '', oab: '', rua: '', numero: '', complemento: '', bairro: '', cidade: '', uf: '', celular: '', email: ''};
	};

	var init = function(){
		$http.get('../advogadoes').success(function(data){
			$scope.lista = data;
		});
				
	};

	init();
}