function controllerParte ($scope, $http, $window) {
	
	$scope.salvar = function(){
		if($scope.unidade.id > 0){
			$http.put('../partes', $scope.unidade).success(function(data){
				$scope.reset();
				$window.alert("Atualizado com sucesso!");
			});			
		} else {
			$http.post('../partes', $scope.unidade).success(function(data){
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
		var confirm = $window.confirm("Tem certeza que deseja excluir a Parte: "+ unidade.nome + "?");
		if(confirm){
			$http.delete('../partes/'+unidade.id).success(function(data){
				var index = $scope.lista.indexOf(unidade);
				$scope.lista.splice(index, 1);
			});
		}
	};	

	$scope.reset = function(){
		$scope.unidade = {nome: '', oab: '', rua: '', numero: '', complemento: '', bairro: '', cidade: '', uf: '', celular: '', email: ''};
	};

	var init = function(){
		$http.get('../partes').success(function(data){
			$scope.lista = data;
		});
				
	};

	init();
}