const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "candystick-app",
        .root_source_file = .{ .path = "src/zig/main.zig" },
        .target = std.zig.CrossTarget{
            .cpu_arch = .thumb,
            .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m0plus },
            .os_tag = .freestanding,
            .abi = .none,
        },
        .optimize = optimize,
    });

    lib.install();

    const cmake_1 = b.addSystemCommand(&[_][]const u8{
        "cmake", "-S", ".", "-B", "./build",
    });
    cmake_1.step.dependOn(&lib.step);

    const cmake_2 = b.addSystemCommand(&[_][]const u8{
        "cmake", "--build", "./build",
    });
    cmake_2.step.dependOn(&cmake_1.step);

    const program_step = b.step("cmake", "Build the project");
    program_step.dependOn(&cmake_2.step);
}
