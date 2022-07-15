import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';
import { AuthService } from 'src/app/services/auth.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  loginForm = new FormGroup({
    rut: new FormControl(
      ''
      ,
      [
        Validators.required
      ]),
    password: new FormControl('', [Validators.required, Validators.minLength(6)])
  });


  mensaje: any = null;
  estado: any = null;

  constructor(
    private api: ApiService,
    private router: Router,
    private auth: AuthService
  ) { }


  ngOnInit(): void {
  }

  async login() {
    try {

      let respuesta: any = await this.api.post('auth/login', this.loginForm.value);

      if (respuesta.access_token) {
        this.auth.setToken(respuesta.access_token);
        this.router.navigate(['/auth/seleccionar-colegio']);
      }



    } catch (e: any) {
      this.mensaje = e.error.error;
      this.estado = "error";
    }







  }


  getErrorMessage(str: string) {
    return this.loginForm.get(str)?.hasError('required') ? 'El campo es requerido' :
      this.loginForm.get(str)?.hasError('rut') ? 'El rut no es valido' :
        '';
  }

  get formControls() {
    return this.loginForm.controls;
  }
}
