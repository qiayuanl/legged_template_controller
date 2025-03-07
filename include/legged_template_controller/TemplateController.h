#pragma once

#include "legged_rl_controllers/OnnxController.h"

namespace legged {
class TemplateController : public OnnxController {
 protected:
  bool parserObservation(const std::string& name) override;
};

}  // namespace legged
