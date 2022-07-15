import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  constructor(
    private http: HttpClient,
    private router: Router
  ) { }


  registroForm = new FormGroup({
    nombres: new FormControl('', [Validators.required]),
    rut: new FormControl('', [Validators.required]),
    apellidos: new FormControl('', [Validators.required]),
    correo: new FormControl('', [Validators.required, Validators.email]),
    contrasena: new FormControl('', [Validators.required, Validators.minLength(6)])
  });

  ngOnInit(): void {
    console.log(localStorage.getItem('token'));
  }

  async registrar() {
    let resultado: any = await this.http.post(
      environment.apiUrl + 'auth/register',
      this.registroForm.value
    ).toPromise();

    if (resultado.token) {
      localStorage.setItem('token', resultado.token);
      this.router.navigate(['auth/register']);
    }
  }
}
