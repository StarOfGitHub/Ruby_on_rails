import { Controller } from '@hotwired/stimulus';

export default class AnnouncementController extends Controller {
  static values = {
    expiresAt: String,
    id: Number,
  };

  dismiss() {
    const expiresAt = new Date(this.expiresAtValue).toUTCString();
    document.cookie = `announcement_${this.idValue}=disabled; expires=${expiresAt}; path=/`;
    this.element.remove();
  }
}
