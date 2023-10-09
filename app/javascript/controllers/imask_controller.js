import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="cpf"
export default class extends Controller {
  // static targets = [ "startDate", "endDate" , "total"]

  connect() {
    const phone = document.getElementById('phone');
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

    const cpf = document.getElementById('cpf');
    const cpfMaskOptions = {
      mask: '000.000.000-00'
    };
    IMask(cpf, cpfMaskOptions);
  }

}
