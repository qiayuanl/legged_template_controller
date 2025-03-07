#include "legged_template_controller/TemplateController.h"

namespace legged {
bool TemplateController::parserObservation(const std::string& name) {
  std::cerr << "TemplateController::parserObservation got called with name: " << name << std::endl;
  if (OnnxController::parserObservation(name)) {
    return true;
  }
  if (name == "my_observation") {
    // observationManager_->addTerm(std::make_shared<MyObservationTerm>(leggedModel));
  } else {
    return false;
  }
  return true;
}

}  // namespace legged

#include "pluginlib/class_list_macros.hpp"

PLUGINLIB_EXPORT_CLASS(legged::TemplateController, controller_interface::ControllerInterface)
