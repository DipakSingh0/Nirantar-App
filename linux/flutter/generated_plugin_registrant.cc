//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <animated_progress_bar/animated_progress_bar_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) animated_progress_bar_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AnimatedProgressBarPlugin");
  animated_progress_bar_plugin_register_with_registrar(animated_progress_bar_registrar);
}
