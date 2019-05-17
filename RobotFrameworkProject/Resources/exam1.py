class exam1(object):

    ROBOT_LIBRARY_VERSION = 1.0
    
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'  
    
    def my_keyword(self, a, b):      
        output=a.split(b)
        guess = a.upper()
        print(guess)
        return output;