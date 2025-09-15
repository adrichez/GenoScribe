document.addEventListener("DOMContentLoaded", function () {
  const toggle = document.getElementById("chat-toggle");
  const box = document.getElementById("chat-box");
  const input = document.getElementById("chat-input");
  const log = document.getElementById("chat-log");

  if (!toggle) return;

  // Abrir/cerrar ventana
  toggle.onclick = function () {
    if (box.style.display === "flex") {
      box.style.display = "none";
    } else {
      box.style.display = "flex";
    }
  };

  // Enviar mensaje con Enter
  input.addEventListener("keydown", function (e) {
    if (e.key === "Enter" && this.value.trim() !== "") {
      const userMsg = this.value;
      this.value = "";

      // Mostrar mensaje del usuario
      log.innerHTML += `<div style="margin-bottom:4px; color:#00c3e0;">▶ ${userMsg}</div>`;

      // Simular respuesta offline
      const botMsg = "Respuesta simulada offline.";
      log.innerHTML += `<div style="margin-bottom:4px;">${botMsg}</div>`;

      // Auto scroll
      log.scrollTop = log.scrollHeight;
    }
  });
});
