// script.js


//#####################################################################################################################################
// SCRIPT JAVASCRIPT PARA FUNCIONALIDADES INTERACTIVAS EN INFORMES DE GENOSCRIBE
//#####################################################################################################################################

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// ARRASTRE HORIZONTAL DE TABLAS DATATABLES
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Función para activar el arrastre
function enableDragScroll() {
  const sliders = document.querySelectorAll(".dataTables_scrollBody");
  
  // Si no encuentra tablas, no hace nada
  if (sliders.length === 0) return;

  sliders.forEach((slider) => {
    // Evitamos añadir el evento dos veces si ya lo tiene
    if (slider.dataset.dragEnabled) return;
    slider.dataset.dragEnabled = "true";

    let isDown = false;
    let startX;
    let scrollLeft;

    slider.addEventListener("mousedown", (e) => {
      isDown = true;
      slider.classList.add("active");
      startX = e.pageX - slider.offsetLeft;
      scrollLeft = slider.scrollLeft;
    });

    slider.addEventListener("mouseleave", () => {
      isDown = false;
      slider.classList.remove("active");
    });

    slider.addEventListener("mouseup", () => {
      isDown = false;
      slider.classList.remove("active");
    });

    slider.addEventListener("mousemove", (e) => {
      if (!isDown) return;
      e.preventDefault();
      const x = e.pageX - slider.offsetLeft;
      const walk = (x - startX) * 2; 
      slider.scrollLeft = scrollLeft - walk;
    });
  });
}


// Intento 1: Al cargar la página normal
document.addEventListener("DOMContentLoaded", enableDragScroll);


// Intento 2: Por si DataTables tarda un poco en renderizarse
// Ejecutamos la función cada medio segundo durante unos instantes para asegurar
let attempts = 0;
const interval = setInterval(() => {
  enableDragScroll();
  attempts++;
  // Dejamos de intentar después de 5 segundos
  if (attempts > 10) clearInterval(interval);
}, 500);
