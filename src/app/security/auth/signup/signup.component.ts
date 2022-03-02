import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/security/service/auth.service';
import { SignupUser } from '../../models/signup-user';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css'],
})
export class SignupComponent implements OnInit {
  form: FormGroup;
  signupUser: SignupUser = new SignupUser('', '', '', '');
  errorMsg: string = '';

  constructor(
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private toastr: ToastrService,
    private router: Router
  ) {
    this.form = this.formBuilder.group({
      username: [
        '',
        [
          Validators.required,
          Validators.minLength(5),
          Validators.maxLength(12),
        ],
      ],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(8)]],
      name: ['', [Validators.required, Validators.minLength(3)]],
    });
  }

  ngOnInit() {}

  onSignup(event: Event) {
    event.preventDefault;
    if (this.form.valid) {
      this.signupUser = new SignupUser(
        this.form.value.username,
        this.form.value.email,
        this.form.value.password,
        this.form.value.name
      );

      this.authService.signup(this.signupUser).subscribe(
        (data) => {
          this.toastr.success('La cuenta ha sido creada!', 'Registro exitoso', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
          });
          this.router.navigate(['/login']);
        },
        (err) => {
          this.errorMsg = err.error.messageSent;
          this.toastr.error(this.errorMsg, 'Registro fallido', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
          });
        }
      );
    } else {
      this.form.markAllAsTouched();
    }
  }

  get Username() {
    return this.form.get('username');
  }

  get Email() {
    return this.form.get('email');
  }

  get Password() {
    return this.form.get('password');
  }

  get Name() {
    return this.form.get('name');
  }
}
