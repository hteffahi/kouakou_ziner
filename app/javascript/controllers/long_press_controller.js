import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    this.handleLongPress = this.handleLongPress.bind(this);
    this.handleMouseUp = this.handleMouseUp.bind(this);

    this.element.addEventListener('touchstart', this.handleLongPress);
    window.addEventListener('touchend', this.handleMouseUp);
  }

  disconnect() {
    this.element.removeEventListener('touchstart', this.handleLongPress);
    window.removeEventListener('touchend', this.handleMouseUp);
  }

  handleLongPress() {
    this.pressTimer = setTimeout(() => {
      console.log('Long press detected!');
      this.showEditForm();
    }, 1000);
  }

  showEditForm() {
    // Ajoutez ici la logique pour afficher le formulaire d'édition
    // Par exemple, affichez un formulaire qui était initialement caché
    const editForm = this.element.querySelector('.edit-form');
    if (editForm) {
      editForm.style.display = 'block';
    }
  }

  handleMouseUp() {
    clearTimeout(this.pressTimer);
  }
}
