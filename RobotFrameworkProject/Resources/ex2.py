class ex2(object):

    def get_keyword_names(self):
        return ['first keyword', 'second keyword']

    def run_keyword(self, name, args):
        print "Running keyword '%s' with arguments %s." % (name, args)
