import accessibleAutocomplete from "accessible-autocomplete";

const initResponsibleBodiesAutocomplete = () => {
  try {
    const inputIds = [
      "#support-user-responsible-body-form-responsible-body-id-field",
      '#school-search-form-responsible-body-id-field'
    ];

    inputIds.forEach(inputId => {
      const responsibleBodiesSelect = document.querySelector(inputId);
      if (!responsibleBodiesSelect) return;

      accessibleAutocomplete.enhanceSelectElement({
        selectElement: responsibleBodiesSelect,
        showAllValues: true,
        confirmOnBlur: false
      });
    });
  } catch (err) {
    console.error("Could not enhance responsible bodies select:", err);
  }
};

export default initResponsibleBodiesAutocomplete;
