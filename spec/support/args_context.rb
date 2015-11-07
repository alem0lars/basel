shared_context :args do
  # Append opts' Hash to args.
  def args_with(opts, args: nil)
    args = respond_to?(:args) ? self.args : [] if args.nil?
    if args.empty?
      []
    elsif args[-1].is_a? Hash
      args[0...-1] + [args[-1].merge(opts)]
    else
      args + [opts]
    end
  end
end
