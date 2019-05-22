from robot.libraries.BuiltIn import BuiltIn
import os
import percy

class PercySetupBuild2():

    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

    def __init__(self):
        self.percy_runner = None

    def Percy_Initialize_Build(self, access_token):
        driver = BuiltIn().get_library_instance('Selenium2Library')._current_browser()
        root_static_dir = os.path.join(os.path.dirname(__file__), '/Users/InternDN19.01.07/Desktop/Intern19_DinhThiAnhThao/AUT/joomla_build2')
        loader = percy.ResourceLoader(
          root_dir=root_static_dir,
          base_url='/joomla_build2',
          webdriver=driver,
        )
        config = percy.Config(access_token=access_token)
        self.percy_runner = percy.Runner(loader=loader, config=config)
        self.percy_runner.initialize_build()

    def Percy_Snapshot(self, name, widths=None):
        self.percy_runner.snapshot(name=name, widths=widths)

    def Percy_Finalize_Build(self):
        self.percy_runner.finalize_build()