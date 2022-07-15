import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SeleccionarColegioComponent } from './seleccionar-colegio.component';

describe('SeleccionarColegioComponent', () => {
  let component: SeleccionarColegioComponent;
  let fixture: ComponentFixture<SeleccionarColegioComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SeleccionarColegioComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SeleccionarColegioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
