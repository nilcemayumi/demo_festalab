import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="imask"
export default class extends Controller {
  connect() {
    const phone = document.getElementById('userPhone');
    const phoneMaskOptions = {
      mask: [
        {
          mask: '(00) 0000-0000',
          length: 10
        },
        {
          mask: '(00) 00000-0000',
          length: 11
        }
      ]
    };
    IMask(phone,phoneMaskOptions);

    const cpf = document.getElementById('userCpf');
    const cpfMaskOptions = {
      mask: '000.000.000-00'
    };
    IMask(cpf, cpfMaskOptions);
  }

}
