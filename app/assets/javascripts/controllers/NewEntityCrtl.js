function NewEntityCtrl (entity, EntityCtrl, $state) {
  var self = this;
  this.entity = new Entity(entity);

  this.data = {
    entity: {
      name: self.entity.name,
      description: self.entity.description
    }
  }

  this.postEntity = function (entity) {
    MainService.postEntity(self.data).then(function (resp) {
      $state.go('entities.show',{id: resp.data.id})
    });
  }

}

angular
  .module('app')
  .controller('NewEntityCtrl', NewEntityCtrl)
