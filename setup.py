
# from setup3lib import setup
from setuptools import setup
from setuptools import find_packages
from huzzer.version import VERSION

additional_args = {
    'zip_safe': False,
    'packages': find_packages(),
    'entry_points': {
        'console_scripts': [
            # 'huzzer = huzzer.__main__:main'
            # 'huzzer = huzzer.__main__'
            'huzz = huzzer.huzz:main'
        ],
    }
}

setup(
    name='huzzer',
    version=VERSION,
    author='Sam Coope',
    author_email='sam.j.coope@gmail.com',
    description=('A very-simple-subset-of-haskell fuzzer'),
    long_description=""" README stuff goes here
    """,
    license='MIT',
    keywords='haskell fuzzer generator',
    url='https://github.com/coopie/huzzer',
    # package_data = {'': ['*.txt',
    #                      'examples/*.py',
    #                      'examples/*/*.py']},
    classifiers=[
        'Intended Audience :: Developers',
        'Natural Language :: English',
        'Operating System :: OS Independent',
        'Programming Language :: Python :: 3',
        'Topic :: Software Development :: Machine Learning'
        ],
    **additional_args
)