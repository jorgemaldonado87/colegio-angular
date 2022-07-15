//servicio para manejar la autenticacion, login, registro, token, etc
//injectable

import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { ApiService } from './api.service';

@Injectable({
  providedIn: 'root'
})

export class AuthService {

  constructor(
    private apiService: ApiService,
    private router: Router
  ) { }




  setToken(token: string) {
    localStorage.setItem('token', token);
    this.traerUsuarioLogueado();
  }

  getToken() {
    return localStorage.getItem('token');
  }

  eliminarToken() {
    localStorage.removeItem('token');
  }

  logeado() {
    return !!this.getToken();
  }


  async traerUsuarioLogueado() {
    try {
      let respuesta: any = await this.apiService.post('auth/me');
      localStorage.setItem('usuario', JSON.stringify(respuesta));

      console.log(respuesta);
    } catch (e) {
      console.log(e);
    }
  }




}
