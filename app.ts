import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'my-app',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './app.html',
  styleUrls: ['./app.css']
})
export class App {
  username: string = '';
  password: string = '';
  message: string = '';

  addUser() {
    const payload = { username: this.username, password: this.password };

    fetch('http://127.0.0.1:8000/signup/', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload)
    })
    .then(res => res.json())
    .then(res => {
      if (res.detail) {
        this.message = res.detail;  // error from backend
      } else {
        this.message = res.message + ' (ID: ' + res.unique_id + ')';
        this.username = '';
        this.password = '';
      }
    })
    .catch(err => this.message = 'Error connecting to backend');
  }
}
