#include <memory>

#include "legged_template_controller/TemplateController.h"

namespace legged {
vector_t TemplateController::playModel(const vector_t& observations) const {
  std::cerr << "TemplateController::playModel" << std::endl;
  return OnnxController::playModel(observations);
}
}  // namespace legged

#include "pluginlib/class_list_macros.hpp"

PLUGINLIB_EXPORT_CLASS(legged::TemplateController, controller_interface::ControllerInterface)
