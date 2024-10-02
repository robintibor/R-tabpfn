#' Install TensorFlow and its dependencies
#'
#' `install_tensorflow()` installs just the tensorflow python package and it's
#' direct dependencies. For a more complete installation that includes
#' additional optional dependencies, use [`keras3::install_keras()`].
#'
#' @details You may be prompted to download and install miniconda if reticulate
#'   did not find a non-system installation of python. Miniconda is the
#'   recommended installation method for most users, as it ensures that the R
#'   python installation is isolated from other python installations. All python
#'   packages will by default be installed into a self-contained conda or venv
#'   environment named "r-reticulate". Note that "conda" is the only supported
#'   method on M1 Mac.
#'
#'   If you initially declined the miniconda installation prompt, you can later
#'   manually install miniconda by running [`reticulate::install_miniconda()`].
#'
#' @section Custom Installation: `install_tensorflow()` or
#'   `keras3::install_keras()` isn't required to use tensorflow with the
#'   package. If you manually configure a python environment with the required
#'   dependencies, you can tell R to use it by pointing reticulate at it,
#'   commonly by setting an environment variable:
#'
#'   ``` R
#'   Sys.setenv("RETICULATE_PYTHON" = "~/path/to/python-env/bin/python")
#'   ```
#'
#' @section Apple Silicon: Beginning with Tensorflow version 2.13, the default
#'   tensorflow package now works on Apple Silicon. See
#'   \url{https://developer.apple.com/metal/tensorflow-plugin/} for instructions
#'   on how to install older versions of Tensorflow on macOS. Please note that
#'   not all operations are supported on Arm Mac GPUs. You can work around the
#'   missing operations by pinning operations to CPU. For example:
#'
#'   ```` R
#'   x <- array(runif(64*64), c(1, 64, 64))
#'   keras3::layer_random_rotation(x, .5)  # Error:
#'   # No registered 'RngReadAndSkip' OpKernel for 'GPU' devices
#'   # Pin the operation to the CPU to avoid the error
#'   with(tf$device("CPU"), keras3::layer_random_rotation(x, .5) ) # No Error
#'   ````
#'
#' @section Additional Packages:
#'
#'   If you wish to add additional PyPI packages to your Keras / TensorFlow
#'   environment you can either specify the packages in the `extra_packages`
#'   argument of `install_tensorflow()` or `install_keras()`, or alternatively
#'   install them into an existing environment using the
#'   [reticulate::py_install()] function. Note that `install_keras()` includes a
#'   set of additional python packages by default, see `?keras3::install_keras`
#'   for details.
#'
#' @md
#'
#' @inheritParams reticulate::py_install
#'
#' @param version TensorFlow version to install. Valid values include:
#'
#'   +  `"default"` installs  `r default_version`
#'
#'   + `"release"` installs the latest release version of tensorflow (which may
#'   be incompatible with the current version of the R package)
#'
#'   + A version specification like `"2.4"` or `"2.4.0"`. Note that if the patch
#'   version is not supplied, the latest patch release is installed (e.g.,
#'   `"2.4"` today installs version "2.4.2")
#'
#'   + `nightly` for the latest available nightly build.
#'
#'   + To any specification, you can append "-cpu" to install the cpu version
#'   only of the package (e.g., `"2.4-cpu"`)
#'
#'   + The full URL or path to a installer binary or python *.whl file.
#'
#' @param extra_packages Additional Python packages to install along with
#'   TensorFlow.
#'
#' @param restart_session Restart R session after installing (note this will
#'   only occur within RStudio).
#'
#' @param python_version Select the Python that will be used to create the
#'   virtualenv. Pass a string with version constraints like `"3.8"`, or
#'   `">=3.9,<=3.11"` or a file path to a `python` executable like
#'   `"/path/to/bin/python3"`. The supplied value is passed on to
#'   `reticulate::virtualenv_starter()`. Note that the Python version must be
#'   compatible with the requested TensorFlow version, documented here:
#'   <https://www.tensorflow.org/install/pip#system-requirements>
#'
#' @param conda_python_version Passed to conda (only applicable if `method = "conda"`)
#'
#' @param cuda logical `TRUE` or `FALSE`. If `install_tensorflow()` detects the
#'   platform is Linux, an Nvidia GPU is available, and the TensorFlow version
#'   is 2.14 (the default), it will install also install the required CUDA
#'   libraries through pip.
#'
#' @param metal Whether to install `tensorflow-metal` pip package on Arm Macs.
#'   This enables tensorflow to use the GPU. Pass a string to install a specific
#'   version like `"tensorflow-metal==0.7.*`.
#'
#' @param pip_ignore_installed Whether pip should ignore installed python
#'   packages and reinstall all already installed python packages.
#'
#' @param new_env If `TRUE`, any existing Python virtual environment and/or
#'   conda environment specified by `envname` is deleted first.
#'
#' @param ... other arguments passed to [`reticulate::conda_install()`] or
#'   [`reticulate::virtualenv_install()`], depending on the `method` used.
#'
#' @seealso
#' -  [`keras3::install_keras()`]
#' -  <https://tensorflow.rstudio.com/reference/tensorflow/install_tensorflow>
#'
#' @export
install_tabpfn <-
function(envname = "r-tabpfn",
         ) {
  writelines("hi")
}
