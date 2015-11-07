module Basel
  # The current basel version informations.
  module Version
    # The current major version.
    MAJOR = 0

    # The current minor version.
    MINOR = 1

    # The current patch version.
    PATCH = 0

    # The version string, following the semvers conventions.
    FULL = [MAJOR, MINOR, PATCH].join(".")
  end
end
