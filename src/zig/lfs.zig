extern fn fs_mount() c_int;

pub const Error = error{
    OK,
    IO,
    CORRUPT,
    NOENT,
    EXISTS,
    NOTDIR,
    ISDIR,
    NOTEMPTY,
    BADF,
    FBIG,
    INVAL,
    NOSPC,
    NOMEM,
    NOATTR,
    NAMETOOLONG,
    OTHER,
};

fn errorFromInt(e: c_int) Error {
    return switch (e) {
        0 => Error.OK,
        else => Error.OTHER,
    };
}

pub fn mount() !void {
    const e = fs_mount();

    if (e != 0) {
        return errorFromInt(e);
    }
}
