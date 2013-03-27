function controllerProcesso ($scope, $http, $window) {

	$ = jQuery;

	$(function() {
    	$('#datepicker1').datepicker();
    	$('#datepicker2').datepicker();
  	});
	
	$scope.salvar = function(){
		if($scope.unidade.id > 0){
			$http.put('../processoes', $scope.unidade).success(function(data){
				$scope.reset();
				$window.alert("Atualizado com sucesso!");
			});			
		} else {
			$http.post('../processoes', $scope.unidade).success(function(data){
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
		var confirm = $window.confirm("Tem certeza que deseja excluir o Processo: "+ unidade.numero + "?");
		if(confirm){
			$http.delete('../processoes/'+unidade.id).success(function(data){
				var index = $scope.lista.indexOf(unidade);
				$scope.lista.splice(index, 1);
			});
		}
	};	

	$scope.reset = function(){
		$scope.unidade = {numero: '', dataEncerramento: '', dataAbertura: '', status: '', tipoProcesso: '', parte: '', advogado: ''};
	};

	var init = function(){
		$http.get('../processoes').success(function(data){
			$scope.lista = data;
		});
				
	};

	init();
}