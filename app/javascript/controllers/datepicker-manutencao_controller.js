import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      minDate: "today", // Configura a data mínima como a data atual
      maxDate: new Date().fp_incr(60), // 60 dias a partir do dia atual
      dateFormat: "d/m/Y", // Formato da data
      allowInput: true, // Permite que o usuário digite a data
      locale: {
        firstDayOfWeek: 0, // Primeiro dia da semana (0 - domingo, 1 - segunda-feira, etc.)
      },
      disable: [
        function(date) {
            // return true to disable
            return (date.getDay() === 0 || date.getDay() === 6); // desabilita FDS

        },
        "29/03/2024"     // desabilita feriado desse mes
      ]

    });
  }
}
