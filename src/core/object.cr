class Object

    def not_nil!
        self
    end

end

struct Nil

    def not_nil!
        panic "casting nil to not-nil!"
    end

end