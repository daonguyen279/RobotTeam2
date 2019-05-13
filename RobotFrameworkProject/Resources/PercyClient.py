from robotlibcore import HybridCore, keyword
from selenium import webdriver
import os

import percy

class Percy(HybridCore):

    def __init__(self):
        libraries = [PercyClient()]
        HybridCore.__init__(self, libraries)


class PercyClient(object):
    
    def __init__(self):
        # Build a ResourceLoader that knows how to collect assets for this application.
        root_static_dir = os.path.join(os.path.dirname(__file__), 'static')
        loader = percy.ResourceLoader(
          root_dir=root_static_dir,
          # Prepend `/assets` to all of the files in the static directory, to match production assets.
          # This is only needed if your static assets are served from a nested directory.
          base_url='/assets',
          webdriver=webdriver,
        )
        
        self.percy_runner = percy.Runner(loader=loader)
        self.percy_runner.initialize_build()

    @keyword('Percy Snapshot')
    def snapshot(self, name):
        self.percy_runner.snapshot(name=name)
        